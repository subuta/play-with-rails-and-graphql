import { useMutation, graphql } from 'relay-hooks'

const mutation = graphql`
  mutation DeleteBookMutation($input: DeleteBookMutationInput!) {
    deleteBook(input: $input) {
      deletedRowId
      errors
    }
  }
`

export default (parentID) => {
  const [mutate, state] = useMutation(mutation, {
    updater: (store) => {
      const payload = store.getRootField('deleteBook')
      // Get the edge of the newly created Book record
      const deletedRowId = payload.getValue('deletedRowId')

      const user = store.get(parentID)
      const userBooks = user.getLinkedRecords('books') || []
      user.setLinkedRecords(
        _.reject(userBooks, (book) => book.getValue('rowId') === deletedRowId),
        'books'
      )
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
