// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Storage {

  string public name = 'Storage';
  uint public filecount = 0;
  mapping(uint => File) public files;

  struct File{
    uint fileId;
    string fileHash;
    uint fileSize;
    string fileType;
    string fileName;
    string fileDescription;
    uint uploadTime;
    address uploader;
  }

  event FileUploaded(
    uint fileId,
    string fileHash,
    uint fileSize,
    string fileType,
    string fileName,
    string fileDescription,
    uint uploadTime,
    address uploader
  );

  constructor() public {
  }

  function uploadFile(string memory _fileHash,uint _fileSize,string memory _fileType,string memory _fileName,string memory _fileDesc) public {

    require(bytes(_fileHash).length > 0);
    require(bytes(_fileType).length > 0);
    require(bytes(_fileName).length > 0);
    require(bytes(_fileDesc).length > 0);
    require(msg.sender != address(0));
    require(_fileSize > 0);
    filecount++;
    files[filecount] = File(filecount,_fileHash,_fileSize,_fileType,_fileName,_fileDesc,block.timestamp, msg.sender);

    emit FileUploaded(filecount, _fileHash, _fileSize, _fileType, _fileName, _fileDesc, block.timestamp, msg.sender);

  }
}
