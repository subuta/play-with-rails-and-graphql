/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
export type AddBookMutationInput = {|
  title: string,
  authorRowId: number,
  clientMutationId?: ?string,
|};
export type AddBookMutationVariables = {|
  input: AddBookMutationInput
|};
export type AddBookMutationResponse = {|
  +addBook: ?{|
    +book: ?{|
      +id: string,
      +rowId: number,
      +title: ?string,
    |},
    +errors: $ReadOnlyArray<string>,
  |}
|};
export type AddBookMutation = {|
  variables: AddBookMutationVariables,
  response: AddBookMutationResponse,
|};
*/


/*
mutation AddBookMutation(
  $input: AddBookMutationInput!
) {
  addBook(input: $input) {
    book {
      id
      rowId
      title
    }
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
    "concreteType": "AddBookMutationPayload",
    "kind": "LinkedField",
    "name": "addBook",
    "plural": false,
    "selections": [
      {
        "alias": null,
        "args": null,
        "concreteType": "Book",
        "kind": "LinkedField",
        "name": "book",
        "plural": false,
        "selections": [
          {
            "alias": null,
            "args": null,
            "kind": "ScalarField",
            "name": "id",
            "storageKey": null
          },
          {
            "alias": null,
            "args": null,
            "kind": "ScalarField",
            "name": "rowId",
            "storageKey": null
          },
          {
            "alias": null,
            "args": null,
            "kind": "ScalarField",
            "name": "title",
            "storageKey": null
          }
        ],
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
    "name": "AddBookMutation",
    "selections": (v1/*: any*/),
    "type": "Mutation",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Operation",
    "name": "AddBookMutation",
    "selections": (v1/*: any*/)
  },
  "params": {
    "cacheID": "78d31849124c51dc42b4348f4c26f1f2",
    "id": null,
    "metadata": {},
    "name": "AddBookMutation",
    "operationKind": "mutation",
    "text": "mutation AddBookMutation(\n  $input: AddBookMutationInput!\n) {\n  addBook(input: $input) {\n    book {\n      id\n      rowId\n      title\n    }\n    errors\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = 'f795789887b66ed67e0c0824df769158';

module.exports = node;
