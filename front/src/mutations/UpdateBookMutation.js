import { commitMutation, graphql } from 'react-relay'
import environment from '../utils/relay-environment'

// const mutation = graphql`
//   mutation UpdateBookMutation($rowId: Int!, $title: String, $authorRowId: Int!) {
//     updateBook(input: { rowId: $rowId, title: $title, authorRowId: $authorRowId }) {
//       book {
//         id
//         rowId
//         title
//       }
//       errors
//     }
//   }
// `
//
// const commit = (title, rowId) => {
//   return commitMutation(environment, {
//     mutation: mutation,
//     variables: {
//       title,
//       rowId,
//     },
//     onCompleted: (response, errors) => {
//       console.log('Response received from server.')
//       console.log('update!', title)
//       console.log('response = ', response)
//       console.log('errors = ', errors)
//     },
//     onError: (err) => {
//       console.error(err)
//     },
//   })
// }

const commit = () => {}

export default { commit }
