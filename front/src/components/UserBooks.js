import React, { useState } from 'react'
import _ from 'lodash'

import { commitMutation, graphql, createFragmentContainer } from 'react-relay'

const Row = (props) => {
  const { isEditing = false, onEdit = _.noop, onSave = _.noop, book } = props

  const [draft, setDraft] = useState(book.title)

  if (isEditing) {
    return (
      <li className="flex items-center">
        <input type="text" onChange={(e) => setDraft(e.target.value)} value={draft} />

        <i className="material-icons ml-2 text-xl cursor-pointer hover:opacity-50" onClick={() => onSave(draft)}>
          save
        </i>
      </li>
    )
  }

  return (
    <li className="flex items-center">
      <span>
        {book.rowId} - {book.title}
      </span>

      <i className="material-icons ml-2 text-xl cursor-pointer hover:opacity-50" onClick={onEdit}>
        edit
      </i>
    </li>
  )
}

const render = createFragmentContainer(
  (props) => {
    const [idInEditing, edit] = useState(null)

    return (
      <ul className="ml-4 bg-red-100">
        {_.map(props.user.books, (book) => (
          <Row
            key={book.rowId}
            book={book}
            isEditing={idInEditing === book.rowId}
            onEdit={() => edit(book.rowId)}
            onSave={(draft) => {}}
          />
        ))}
      </ul>
    )
  },
  {
    user: graphql`
      fragment UserBooks_user on User {
        id
        books {
          id
          rowId
          title
        }
      }
    `,
  }
)

export default render
