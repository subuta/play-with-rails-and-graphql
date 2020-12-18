import React from 'react'
import _ from 'lodash'

import { graphql, createFragmentContainer } from 'react-relay'

const render = createFragmentContainer(
  (props) => {
    return (
      <ul className="ml-4 bg-red-100">
        {_.map(props.user.books, (book) => (
          <li key={book.rowId}>
            {book.rowId} - {book.title}
          </li>
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
