// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    event ItemPurchased(address indexed buyer, string item, uint256 price, uint256 quantity);

    struct Item {
        string name;
        uint256 price;
        uint256 quantity;
    }

    mapping(string => Item) public items;

    constructor() ERC20("Degen", "DGN") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), to, amount);
        return true;
    }

    function sellItem(string memory itemName, uint256 price, uint256 quantity) public onlyOwner {
        require(price > 0, "Price must be greater than zero");
        require(quantity > 0, "Quantity must be greater than zero");

        Item storage newItem = items[itemName];
        newItem.name = itemName;
        newItem.price = price;
        newItem.quantity = quantity;
    }

    function buyItem(string memory itemName, uint256 quantity) public {
        require(quantity > 0, "Quantity must be greater than zero");

        Item storage item = items[itemName];
        require(item.quantity >= quantity, "Not enough quantity available for purchase");

        uint256 totalPrice = item.price * quantity;
        require(totalPrice <= balanceOf(msg.sender), "Insufficient funds");

        _burn(msg.sender, totalPrice);
        item.quantity -= quantity;

        emit ItemPurchased(msg.sender, itemName, item.price, quantity);
    }
}