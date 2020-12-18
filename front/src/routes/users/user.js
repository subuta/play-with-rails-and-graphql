// App.js
import React from 'react'

import environment from '../../utils/relay-environment'

import { graphql, QueryRenderer } from 'react-relay'

import { useParams, Link } from 'react-router-dom'

const render = () => {
  const { id } = useParams()
  if (!id) return null

  return (
    <div>
      <Link to="/" className="my-2 flex items-center">
        <i className="material-icons">chevron_left</i>
        <span>Back to Top</span>
      </Link>

      <QueryRenderer
        environment={environment}
        query={graphql`
          query userQuery($rowId: Int!) {
            user(rowId: $rowId) {
              rowId
              email
            }
          }
        `}
        variables={{ rowId: Number(id) }}
        render={({ error, props }) => {
          if (error) {
            return <div>Error!</div>
          }
          if (!props) {
            return <div>Loading...</div>
          }
          return <div>User ID: {props.user.rowId}</div>
        }}
      />
    </div>
  )
}

export default render
