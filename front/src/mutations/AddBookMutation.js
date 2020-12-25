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
    // configs: [
    //   {
    //     type: 'RANGE_ADD',
    //     parentID,
    //     connectionInfo: [
    //       {
    //         key: 'AddShip_ships',
    //         rangeBehavior: 'append',
    //       },
    //     ],
    //     edgeName: 'shipEdge',
    //   },
    // ],
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
