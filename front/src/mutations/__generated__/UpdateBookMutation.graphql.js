/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
export type UpdateBookMutationInput = {|
  rowId: number,
  title: string,
  authorRowId?: ?number,
  clientMutationId?: ?string,
|};
export type UpdateBookMutationVariables = {|
  input: UpdateBookMutationInput
|};
export type UpdateBookMutationResponse = {|
  +updateBook: ?{|
    +book: ?{|
      +id: string,
      +rowId: number,
      +title: ?string,
    |},
    +errors: $ReadOnlyArray<string>,
  |}
|};
export type UpdateBookMutation = {|
  variables: UpdateBookMutationVariables,
  response: UpdateBookMutationResponse,
|};
*/


/*
mutation UpdateBookMutation(
  $input: UpdateBookMutationInput!
) {
  updateBook(input: $input) {
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
    "concreteType": "UpdateBookMutationPayload",
    "kind": "LinkedField",
    "name": "updateBook",
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
    "name": "UpdateBookMutation",
    "selections": (v1/*: any*/),
    "type": "Mutation",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Operation",
    "name": "UpdateBookMutation",
    "selections": (v1/*: any*/)
  },
  "params": {
    "cacheID": "3950e62c0705773e5d3a4a72d9403ab6",
    "id": null,
    "metadata": {},
    "name": "UpdateBookMutation",
    "operationKind": "mutation",
    "text": "mutation UpdateBookMutation(\n  $input: UpdateBookMutationInput!\n) {\n  updateBook(input: $input) {\n    book {\n      id\n      rowId\n      title\n    }\n    errors\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = 'ac32ea9ba766712da2ddc56f2c13c379';

module.exports = node;
