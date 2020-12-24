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
  const [mutate, state] = useMutation(mutation, {
    onCompleted: (response, errors) => {
      console.log('Response received from server.')
      console.log('response = ', response)
      console.log('errors = ', errors)
    },
    onError: (err) => {
      console.error(err)
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
