pragma solidity ^0.4.17;

contract Adoptions {

  /// @dev Only 16 pets can ever be in circulation
  address[16] public adopters;

  /// @dev Allow anyone to adopt a pet by calling this function
  /// @dev Yes, people can steal each other's pets
  function adopt(uint _petId) public returns (uint) {
    require(_petId >= 0 && _petId <= 15);
    adopters[_petId] = msg.sender;
    return _petId;
  }

  /// @dev A getter function to return the entire array of adopters
  function getAdopters() public view returns (address[16]) {
    return adopters;
  }



}
