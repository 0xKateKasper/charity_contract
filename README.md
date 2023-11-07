![alt text](imgs/charity.png "quiz")

# Discord - kate_kasper

#Charity Contract on Aleo

A decentralized application on the Aleo platform that allows users to maintain a wishlist and grant access to specific people to view it.

## Structures

1. **String**:
    Represents a string in the contract with a limitation in length. Each `data` field contains a part of the string.

2. **WishlistItem**:
    Represents an item in the user's wishlist. It has a name and a description.

3. **People**:
    Represents a list of addresses. Used to maintain the list of people who have access to view a user's wishlist.

## Mappings

1. **user_wishlists**: 
    Maps a user's address to their wishlist item.

2. **user_access**: 
    Maps a user's address to the list of people who have access to view their wishlist.

## Transitions & Finalizations

1. **add_item**: 
    Allows a user to add an item to their wishlist. The transition takes the user's address, item name, and description. The finalization function then stores the item in the `user_wishlists` mapping.

2. **grant_access**: 
    Enables a user to grant access to a specific person to view their wishlist. The transition requires the user's address, the address of the person being granted access, and the position to store the granted address in the list. The finalization function updates the `user_access` mapping.

3. **view_wishlist**:
    Allows a person to request to view a user's wishlist. Access is granted if the requester is in the user's access list or if the requester is the owner of the wishlist. The transition requires the wishlist owner's address and the requester's address. The finalization function then provides the requested wishlist.

## How to Use

1. **Adding an Item**:
    Use the `add_item` transition. Provide the user's address and the item details (name and description).

2. **Granting Access**:
    Use the `grant_access` transition. Provide the user's address, the address of the person being granted access, and the position (from 0 to 4) to store the granted address.

3. **Viewing a Wishlist**:
    Use the `view_wishlist` transition. Provide the wishlist owner's address and the requester's address.

## Program Input Examples

1. **add_item**: 
    Sample input provided shows a user address and item details.

2. **grant_access**: 
    Sample input demonstrates how a user can grant another user access to view their wishlist. The position specifies the slot in which the granted address will be stored (from 0 to 4).

3. **view_wishlist**: 
    Sample input to request to view a user's wishlist. The requester address and the wishlist owner's address should be provided.


License: MIT
