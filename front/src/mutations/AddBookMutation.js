import { useMutation, graphql } from 'relay-hooks'

const mutation = graphql`
  mutation AddBookMutation($input: AddBookMutationInput!) {
    addBook(input: $input) {
      book {
        id
        rowId
        title
      }
      errors
    }
  }
`

export default (parentID) => {
  const [mutate, state] = useMutation(mutation, {
    onCompleted: (response, errors) => {
      console.log('Response received from server.')
      console.log('response = ', response)
      console.log('errors = ', errors)
    },
    onError: (err) => {
      console.error(err)
    },
    updater: (store) => {
      const payload = store.getRootField('addBook')
      // Get the edge of the newly created Book record
      const book = payload.getLinkedRecord('book')

      const user = store.get(parentID)
      const userBooks = user.getLinkedRecords('books') || []
      user.setLinkedRecords([...userBooks, book], 'books')
    },
  })

  return [
    (input) => {
      return mutate({
        variables: { input },
      })
    },
    state,
  ]
}
