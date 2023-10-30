program charity.aleo;

struct String:
    data0 as u128;
    data1 as u128;
    data2 as u128;
    data3 as u128;
    data4 as u128;
    data5 as u128;
    data6 as u128;
    data7 as u128;

struct WishlistItem:
    item_name as String;
    item_description as String;

struct People:
    data0 as address;
    data1 as address;
    data2 as address;
    data3 as address;
    data4 as address;


mapping user_wishlists:
	key left as address.public;
	value right as WishlistItem.public;


mapping user_access:
	key left as address.public;
	value right as People.public;

function add_item:
    input r0 as address.private;
    input r1 as String.private;
    input r2 as String.private;

    finalize r0 r1 r2;

finalize add_item:
    input r0 as address.public;
    input r1 as String.public;
    input r2 as String.public;
    cast r1 r2 into r3 as WishlistItem;
    set r3 into user_wishlists[r0];


function grant_access:
    input r0 as address.private;
    input r1 as address.private;
    input r2 as u8.private;

    finalize r0 r1 r2;

finalize grant_access:
    input r0 as address.public;
    input r1 as address.public;
    input r2 as u8.public;
    get user_access[r0] into r3;
    is.eq r2 0u8 into r4;
    cast r1 r3.data1 r3.data2 r3.data3 r3.data4 into r5 as People;
    is.eq r2 1u8 into r6;
    cast r3.data0 r1 r3.data2 r3.data3 r3.data4 into r7 as People;
    is.eq r2 2u8 into r8;
    cast r3.data0 r3.data1 r1 r3.data3 r3.data4 into r9 as People;
    is.eq r2 3u8 into r10;
    cast r3.data0 r3.data1 r3.data2 r1 r3.data4 into r11 as People;
    is.eq r2 4u8 into r12;
    cast r3.data0 r3.data1 r3.data2 r3.data3 r1 into r13 as People;


function view_wishlist:
    input r0 as address.private;
    input r1 as address.private;

    finalize r0 r1;

finalize view_wishlist:
    input r0 as address.public;
    input r1 as address.public;
    get user_access[r0] into r2;
    is.eq r2.data0 r1 into r3;
    is.eq r2.data1 r1 into r4;
    or r3 r4 into r5;
    is.eq r2.data2 r1 into r6;
    or r5 r6 into r7;
    is.eq r2.data3 r1 into r8;
    or r7 r8 into r9;
    is.eq r2.data4 r1 into r10;
    or r9 r10 into r11;
    is.eq r0 r1 into r12;
    or r11 r12 into r13;
    get user_wishlists[r0] into r14;
