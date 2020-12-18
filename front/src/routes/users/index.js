// App.js
import React from 'react'
import _ from 'lodash'

import environment from '../../utils/relay-environment'

import UserBooks from '../../components/UserBooks'

import { Link } from 'react-router-dom'

import { graphql, QueryRenderer } from 'react-relay'

const render = () => {
  return (
    <QueryRenderer
      environment={environment}
      query={graphql`
        query usersQuery {
          users(rowIds: [1, 2, 3]) {
            nodes {
              id
              rowId
              username
              ...UserBooks_user
            }
          }
        }
      `}
      variables={{}}
      render={({ error, props }) => {
        if (error) {
          return <div>Error!</div>
        }
        if (!props) {
          return <div>Loading...</div>
        }

        return (
          <div>
            <ul>
              {_.map(props.users.nodes, (user) => (
                <li key={user.rowId} className="mb-4">
                  <Link to={`/user/${user.rowId}`}>
                    {user.rowId} - <span className="font-bold">{user.username}</span>
                  </Link>

                  <UserBooks user={user} />
                </li>
              ))}
            </ul>
          </div>
        )
      }}
    />
  )
}

export default render
