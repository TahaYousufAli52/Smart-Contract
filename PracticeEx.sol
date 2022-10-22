//SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0;

// Q1
// Print “Hello world”. Store ‘Hello world’ in a global variable.
string constant greet = "Hello World!";

contract PracticeAssignment {
    string public email = "xyz@gmail.com";

    // Q2
    // Create a state variable and store an unsigned integer value in it. Create a function to return the value of variable
    uint aVar = 10;
    function get_aVar() public view returns(uint) {
        return aVar;
    }

    // Q3
    // Create a local variable and store an integer value in it. Create a function to return the value of variable.
    function get_bVar() public pure returns(int8) {
        int8 bVar = 53;
        return bVar;
    }

    // Q4
    // Create a function with one argument in it. Set the new value to the state variable.
    function setGreet(string memory _email) public {
        email = _email;
    }

    // Q5
    // Create a function which takes one integer argument and returns ‘1’ if the argument passed is a prime number otherwise returns ‘0’.
    function checkPrime(uint _number) public pure returns(uint) {
        for (uint256 i = 2; i < _number; i++) {
            if (_number % i == 0) {
                return 0;
            }
        }
        return 1;
    }

    // Q6
    // Create an ‘struct’ for book with 3 attributes. Implement set and get for accessibility of struct elements.
    struct Book {
        string name;
        string reviews;
        int8 ratings;
    }
    Book book;
    function setBook(string memory _name, string memory _reviews, int8 _ratings) public {
        book.name = _name;
        book.reviews = _reviews;
        book.ratings = _ratings;
    }
    function getBook() public view returns (Book memory) {
        return book;
    }

    // Q7
    // Create a variable of type ‘enum’(small, medium, large).  Create two functions to set and get the enum values.
    enum Sizes {
        small,
        medium,
        large
    }
    Sizes public sizes;
    function get() public view returns (Sizes) {
        return sizes;
    }
    // Update status by passing uint into input
    function set(Sizes _sizes) public {
        sizes = _sizes;
    }
    // You can update to a specific enum like this
    function cancel() public {
        sizes = Sizes.medium;
    }
    // delete resets the enum to its first value, 0
    function reset() public {
        delete sizes;
    }

    // Q8
    // Create a constructor()  to set the value of owner. Create a function which returns the address of the owner but it would be accessible by owner only.
    address owner;
    constructor() {
        owner = msg.sender;
    }

    function getOwner() public onlyOwner view returns(address) {
        return owner;
    }
    modifier onlyOwner() {
      require(
          msg.sender == owner, "err"
        );  
      _;
    }

    // Q9
    // Create a mapping to map address with balance. Create a function which sets the balance for the address which is calling the function. Create another function which is used to get the balance of any address.
    mapping(address => uint) public myBalance;

    function setBalance (address _add, uint _balance) public {
        myBalance[_add] = _balance;
    }
    function getBalance (address _address) public view returns(uint) {
        return myBalance[_address];
    }
}