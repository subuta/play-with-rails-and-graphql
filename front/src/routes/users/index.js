// App.js
import React from 'react'
import _ from 'lodash'

import environment from '../../utils/relay-environment'

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
                <li key={user.rowId}>
                  <Link to={`/user/${user.rowId}`}>
                    {user.rowId} - {user.username}
                  </Link>
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
