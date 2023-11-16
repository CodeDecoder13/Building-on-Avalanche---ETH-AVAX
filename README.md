# Building-on-Avalanche---ETH-AVAX
# DegenToken

DegenToken represents an ERC-20 token contract integrating a decentralized marketplace feature. This contract allows the owner to perform essential token operations like minting and burning, alongside facilitating the sale of items using these tokens.

## Contract Overview

- **Token Name:** DegenToken (DGN)
- **Standard:** ERC-20
- **Based on:** OpenZeppelin's ERC20 and Ownable contracts

## Key Functions

### Mint

Enables the owner to create new tokens and allocate them to a specified address.

Function signature: `function mint(address to, uint256 amount) public onlyOwner`

### Burn

Allows any address to destroy a specific amount of their own tokens.

Function signature: `function burn(uint256 amount) public`

### Transfer

Overrides the standard ERC-20 transfer function to accommodate custom logic.

Function signature: `function transfer(address to, uint256 amount) public override returns (bool)`

### Sell Item

Empowers the owner to list items for sale by defining their price and quantity.

Function signature: `function sellItem(string memory itemName, uint256 price, uint256 quantity) public onlyOwner`

### Buy Item

Enables any address to purchase items listed by the owner using DegenTokens. The tokens used for the purchase are subsequently burned.

Function signature: `function buyItem(string memory itemName, uint256 quantity) public`

## Events

### ItemPurchased

Emitted when a buyer successfully buys an item.

Event signature: `event ItemPurchased(address indexed buyer, string item, uint256 price, uint256 quantity);`

Event signature: event ItemPurchased(address indexed buyer, string item, uint256 price, uint256 quantity);

This modified content can serve as a more descriptive README for your DegenToken contract.
