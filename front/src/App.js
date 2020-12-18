// App.js
import React from 'react'

import environment from './utils/relay-environment'

import { graphql, QueryRenderer } from 'react-relay'

const render = () => {
  return (
    <QueryRenderer
      environment={environment}
      query={graphql`
        query AppQuery {
          user(rowId: 1) {
            rowId
            email
          }
        }
      `}
      variables={{}}
      render={({ error, props }) => {
        console.log(props)
        console.log(error)
        if (error) {
          return <div>Error!</div>
        }
        if (!props) {
          return <div>Loading...</div>
        }
        return <div>User ID: {props.user.rowId}</div>
      }}
    />
  )
}

export default render
