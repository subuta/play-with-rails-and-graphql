// App.js
import React from 'react'
import _ from 'lodash'
import classNames from 'classnames'

import environment from '../../utils/relay-environment'

import UserBooks from '../../components/UserBooks'

import { Link } from 'react-router-dom'

import { createPaginationContainer } from 'react-relay'
import { useQuery, graphql } from 'relay-hooks'

// TODO: migrate `createPaginationContainer` to `usePagination`

const count = 2

const Users = ({ rootQuery, relay }) => {
  if (!rootQuery) return <div />

  const hasNextPage = relay.hasMore()

  const loadMore = () => {
    if (relay.isLoading()) return

    relay.loadMore(
      count, // Fetch the next n items
      (error) => {
        if (error) {
          console.error(error)
        }
      }
    )
  }

  return (
    <div>
      <ul>
        {_.map(rootQuery.users.edges, (edge) => {
          const user = edge.node
          return (
            <li key={user.rowId} className="mb-4">
              <Link to={`/user/${user.rowId}`}>
                {user.rowId} - <span className="font-bold">{user.username}</span>
              </Link>

              <UserBooks user={user} />
            </li>
          )
        })}
      </ul>

      <button
        className={classNames([
          'py-2 px-4 bg-blue-500 text-white rounded font-bold',
          !hasNextPage && 'opacity-50 pointer-events-none',
        ])}
        onClick={hasNextPage ? loadMore : _.noop}
      >
        Load more
      </button>
    </div>
  )
}

// SEE: https://github.com/facebook/relay/issues/1705
const PaginatedUsers = createPaginationContainer(
  Users,
  {
    rootQuery: graphql`
      fragment users_feed on Query {
        users(first: $count, after: $cursor) @connection(key: "users_users") {
          edges {
            cursor
            node {
              id
              rowId
              username
              ...UserBooks_user
            }
          }
        }
      }
    `,
  },
  {
    query: graphql`
      query usersPaginatedQuery($count: Int!, $cursor: String) {
        ...users_feed
      }
    `,
    getFragmentVariables(prevVars, totalCount) {
      return {
        ...prevVars,
        count: totalCount,
      }
    },
    getVariables(props, { count, cursor }, fragmentVariables) {
      return {
        count,
        cursor,
      }
    },
  }
)

const usersQuery = graphql`
  query usersQuery($count: Int!, $cursor: String) {
    ...users_feed
  }
`

const render = () => {
  const { error, props } = useQuery(
    usersQuery,
    {
      count: count,
      cursor: null,
    },
    { fetchPolicy: 'network-only' }
  )

  if (error) {
    return <div>Error!</div>
  }
  if (!props) {
    return <div>Loading...</div>
  }

  return (
    <div>
      <PaginatedUsers rootQuery={props} />
    </div>
  )
}

export default render
