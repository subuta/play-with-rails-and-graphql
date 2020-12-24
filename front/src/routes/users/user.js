// App.js
import React from 'react'

import environment from '../../utils/relay-environment'

import UserBooks from '../../components/UserBooks'

import { useQuery, graphql } from 'relay-hooks'

import { useParams, Link } from 'react-router-dom'

const userQuery = graphql`
  query userQuery($rowId: Int!) {
    user(rowId: $rowId) {
      id
      rowId
      username
      email
      ...UserBooks_user
    }
  }
`

const User = ({ id }) => {
  const { error, props } = useQuery(userQuery, { rowId: Number(id) }, { fetchPolicy: 'network-only' })

  if (error) {
    return <div>Error!</div>
  }
  if (!props) {
    return <div>Loading...</div>
  }
  return (
    <div>
      <h2 className="font-bold">UserName: {props.user.username}</h2>
      <h4 className="mt-4">Written books:</h4>
      <UserBooks user={props.user} />
    </div>
  )
}

const render = () => {
  const { id } = useParams()
  if (!id) return null

  return (
    <div>
      <Link to="/" className="my-2 flex items-center">
        <i className="material-icons">chevron_left</i>
        <span>Back to Top</span>
      </Link>

      <User id={id} />
    </div>
  )
}

export default render
