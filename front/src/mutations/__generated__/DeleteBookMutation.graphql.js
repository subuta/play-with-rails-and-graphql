/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
export type DeleteBookMutationInput = {|
  rowId: number,
  clientMutationId?: ?string,
|};
export type DeleteBookMutationVariables = {|
  input: DeleteBookMutationInput
|};
export type DeleteBookMutationResponse = {|
  +deleteBook: ?{|
    +deletedRowId: number,
    +errors: $ReadOnlyArray<string>,
  |}
|};
export type DeleteBookMutation = {|
  variables: DeleteBookMutationVariables,
  response: DeleteBookMutationResponse,
|};
*/


/*
mutation DeleteBookMutation(
  $input: DeleteBookMutationInput!
) {
  deleteBook(input: $input) {
    deletedRowId
    errors
  }
}
*/

const node/*: ConcreteRequest*/ = (function(){
var v0 = [
  {
    "defaultValue": null,
    "kind": "LocalArgument",
    "name": "input"
  }
],
v1 = [
  {
    "alias": null,
    "args": [
      {
        "kind": "Variable",
        "name": "input",
        "variableName": "input"
      }
    ],
    "concreteType": "DeleteBookMutationPayload",
    "kind": "LinkedField",
    "name": "deleteBook",
    "plural": false,
    "selections": [
      {
        "alias": null,
        "args": null,
        "kind": "ScalarField",
        "name": "deletedRowId",
        "storageKey": null
      },
      {
        "alias": null,
        "args": null,
        "kind": "ScalarField",
        "name": "errors",
        "storageKey": null
      }
    ],
    "storageKey": null
  }
];
return {
  "fragment": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Fragment",
    "metadata": null,
    "name": "DeleteBookMutation",
    "selections": (v1/*: any*/),
    "type": "Mutation",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Operation",
    "name": "DeleteBookMutation",
    "selections": (v1/*: any*/)
  },
  "params": {
    "cacheID": "b3aef5615a72ab41cbf6a023218937df",
    "id": null,
    "metadata": {},
    "name": "DeleteBookMutation",
    "operationKind": "mutation",
    "text": "mutation DeleteBookMutation(\n  $input: DeleteBookMutationInput!\n) {\n  deleteBook(input: $input) {\n    deletedRowId\n    errors\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '760492998f4232cd808e233aedb0827f';

module.exports = node;
