pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoptions.sol";

contract TestAdoptions {
  Adoptions adoptions = Adoptions(DeployedAddresses.Adoptions());

  /// @dev Testing the adopt() function
  function testUserCanAdoptPet() public {
    uint returnedId = adoptions.adopt(8);
    uint expected = 8;
    Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
  }

  /// @dev Testing retrieval of a single pet's owner
  function testGetAdopterAddressByPetId() public {
    /// @dev Expected owner is this contract
    address expected = this;
    address adopter = adoptions.adopters(8);
    Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded.");
  }

  /// @dev Testing retrieval of all pet owners, getAdopters() function
  function testGetAdopterAddressByPetIdInArray() public {
    /// @dev Expected owner is this contract
    address expected = this;
    /// @dev Store adopters in memory rather than contract's storage
    address[16] memory adopters = adoptions.getAdopters();
    Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
  }

}
