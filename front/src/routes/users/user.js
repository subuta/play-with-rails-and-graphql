// App.js
import React, { useState } from 'react'

import { useQuery, graphql } from 'relay-hooks'
import { useParams, Link } from 'react-router-dom'

import UserBooks from '../../components/UserBooks'

import useUpdateBookMutation from '../../mutations/AddBookMutation'

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

const User = ({ user }) => {
  return (
    <div>
      <h2 className="font-bold">UserName: {user.username}</h2>
      <h4 className="mt-4">Written books:</h4>
      <UserBooks user={user} />
    </div>
  )
}

const render = () => {
  const [draft, setDraft] = useState('')
  const { id } = useParams()

  if (!id) return null

  const { error, props } = useQuery(userQuery, { rowId: Number(id) }, { fetchPolicy: 'network-only' })
  const [mutate] = useUpdateBookMutation(_.get(props, 'user.id', null))

  if (error) {
    return <div>Error!</div>
  }
  if (!props) {
    return <div>Loading...</div>
  }

  return (
    <div>
      <Link to="/" className="my-2 flex items-center">
        <i className="material-icons">chevron_left</i>
        <span>Back to Top</span>
      </Link>

      <User user={props.user} />

      <div className="mt-4 flex flex-col w-64">
        <input className="border px-2 py-1" type="text" onChange={(e) => setDraft(e.target.value)} value={draft} />

        <button
          className="mt-2 py-2 px-4 bg-blue-500 text-white rounded font-bold"
          onClick={async () => {
            await mutate({ title: draft, authorRowId: Number(id) })
            setDraft('')
          }}
        >
          Add Book
        </button>
      </div>
    </div>
  )
}

export default render
