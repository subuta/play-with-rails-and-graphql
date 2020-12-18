/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
import type { FragmentReference } from "relay-runtime";
declare export opaque type UserBooks_user$ref: FragmentReference;
declare export opaque type UserBooks_user$fragmentType: UserBooks_user$ref;
export type UserBooks_user = {|
  +id: string,
  +books: ?$ReadOnlyArray<{|
    +id: string,
    +rowId: number,
    +title: ?string,
  |}>,
  +$refType: UserBooks_user$ref,
|};
export type UserBooks_user$data = UserBooks_user;
export type UserBooks_user$key = {
  +$data?: UserBooks_user$data,
  +$fragmentRefs: UserBooks_user$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = (function(){
var v0 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "id",
  "storageKey": null
};
return {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "UserBooks_user",
  "selections": [
    (v0/*: any*/),
    {
      "alias": null,
      "args": null,
      "concreteType": "Book",
      "kind": "LinkedField",
      "name": "books",
      "plural": true,
      "selections": [
        (v0/*: any*/),
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
    }
  ],
  "type": "User",
  "abstractKey": null
};
})();
// prettier-ignore
(node/*: any*/).hash = 'aad401cc425659ae4284e1a2ee3191b0';

module.exports = node;
