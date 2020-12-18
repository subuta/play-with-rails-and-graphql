/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
export type usersQueryVariables = {||};
export type usersQueryResponse = {|
  +users: {|
    +nodes: ?$ReadOnlyArray<?{|
      +id: string,
      +rowId: number,
      +username: ?string,
    |}>
  |}
|};
export type usersQuery = {|
  variables: usersQueryVariables,
  response: usersQueryResponse,
|};
*/


/*
query usersQuery {
  users(rowIds: [1, 2, 3]) {
    nodes {
      id
      rowId
      username
    }
  }
}
*/

const node/*: ConcreteRequest*/ = (function(){
var v0 = [
  {
    "alias": null,
    "args": [
      {
        "kind": "Literal",
        "name": "rowIds",
        "value": [
          1,
          2,
          3
        ]
      }
    ],
    "concreteType": "UserConnection",
    "kind": "LinkedField",
    "name": "users",
    "plural": false,
    "selections": [
      {
        "alias": null,
        "args": null,
        "concreteType": "User",
        "kind": "LinkedField",
        "name": "nodes",
        "plural": true,
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
            "name": "username",
            "storageKey": null
          }
        ],
        "storageKey": null
      }
    ],
    "storageKey": "users(rowIds:[1,2,3])"
  }
];
return {
  "fragment": {
    "argumentDefinitions": [],
    "kind": "Fragment",
    "metadata": null,
    "name": "usersQuery",
    "selections": (v0/*: any*/),
    "type": "Query",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": [],
    "kind": "Operation",
    "name": "usersQuery",
    "selections": (v0/*: any*/)
  },
  "params": {
    "cacheID": "c6506131b22d205d20f4a82afc58af0d",
    "id": null,
    "metadata": {},
    "name": "usersQuery",
    "operationKind": "query",
    "text": "query usersQuery {\n  users(rowIds: [1, 2, 3]) {\n    nodes {\n      id\n      rowId\n      username\n    }\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '8d6e1737bcb38618fa29887d32b90522';

module.exports = node;
