import { useMutation, graphql } from 'relay-hooks'

const mutation = graphql`
  mutation UpdateBookMutation($input: UpdateBookMutationInput!) {
    updateBook(input: $input) {
      book {
        id
        rowId
        title
      }
      errors
    }
  }
`

export default () => {
  const [mutate, state] = useMutation(mutation, {})

  return [
    (input) => {
      return mutate({
        variables: { input },
      })
    },
    state,
  ]
}
