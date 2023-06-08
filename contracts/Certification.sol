pragma solidity ^0.4.24;

contract Certification {
    constructor() public {}

    struct Certificate {
        string name;
        string type;
        string event;
        uint256 dateOfIssue;
    }

    mapping(bytes32 => Certificate) public certificates;

    event certificateGenerated(bytes32 _certificateId);

    function stringToBytes32(string memory source) private pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }
        assembly {
                result := mload(add(source, 32))
        }
    }

    function generateCertificate(
        string memory _id,
        string memory _name,
        string memory _type, 
        string memory _event, 
        uint256 _dateOfIssue) public {
        bytes32 byte_id = stringToBytes32(_id);
        require(certificates[byte_id].dateOfIssue == 0, "Certificate with given id already exists");
        certificates[byte_id] = Certificate(_name, _type, _event, _dateOfIssue);
        emit certificateGenerated(byte_id);
    }

    function getData(string memory _id) public view returns(string memory, string memory, string memory, uint256) {
        bytes32 byte_id = stringToBytes32(_id);
        Certificate memory temp = certificates[byte_id];
        require(temp.dateOfIssue != 0, "No data exists");
        return (temp.name, temp.type, temp.event, temp.dateOfIssue);
    }
}