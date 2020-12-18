/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type UserBooks_user$ref = any;
export type usersQueryVariables = {||};
export type usersQueryResponse = {|
  +users: {|
    +nodes: ?$ReadOnlyArray<?{|
      +id: string,
      +rowId: number,
      +username: ?string,
      +$fragmentRefs: UserBooks_user$ref,
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
      ...UserBooks_user
    }
  }
}

fragment UserBooks_user on User {
  id
  books {
    id
    rowId
    title
  }
}
*/

const node/*: ConcreteRequest*/ = (function(){
var v0 = [
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
v1 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "id",
  "storageKey": null
},
v2 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "rowId",
  "storageKey": null
},
v3 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "username",
  "storageKey": null
};
return {
  "fragment": {
    "argumentDefinitions": [],
    "kind": "Fragment",
    "metadata": null,
    "name": "usersQuery",
    "selections": [
      {
        "alias": null,
        "args": (v0/*: any*/),
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
              (v1/*: any*/),
              (v2/*: any*/),
              (v3/*: any*/),
              {
                "args": null,
                "kind": "FragmentSpread",
                "name": "UserBooks_user"
              }
            ],
            "storageKey": null
          }
        ],
        "storageKey": "users(rowIds:[1,2,3])"
      }
    ],
    "type": "Query",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": [],
    "kind": "Operation",
    "name": "usersQuery",
    "selections": [
      {
        "alias": null,
        "args": (v0/*: any*/),
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
              (v1/*: any*/),
              (v2/*: any*/),
              (v3/*: any*/),
              {
                "alias": null,
                "args": null,
                "concreteType": "Book",
                "kind": "LinkedField",
                "name": "books",
                "plural": true,
                "selections": [
                  (v1/*: any*/),
                  (v2/*: any*/),
                  {
                    "alias": null,
                    "args": null,
                    "kind": "ScalarField",
                    "name": "title",
                    "storageKey": null
                  }
                ],
                "storageKey": null
              }
            ],
            "storageKey": null
          }
        ],
        "storageKey": "users(rowIds:[1,2,3])"
      }
    ]
  },
  "params": {
    "cacheID": "c47744ae5723b5bae501b2f08e9a7727",
    "id": null,
    "metadata": {},
    "name": "usersQuery",
    "operationKind": "query",
    "text": "query usersQuery {\n  users(rowIds: [1, 2, 3]) {\n    nodes {\n      id\n      rowId\n      username\n      ...UserBooks_user\n    }\n  }\n}\n\nfragment UserBooks_user on User {\n  id\n  books {\n    id\n    rowId\n    title\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '758287f51d8677aedc4ae161d168e246';

module.exports = node;
