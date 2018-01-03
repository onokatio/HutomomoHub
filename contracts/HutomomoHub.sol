pragma solidity 0.4.18;

contract HutomomoHub {

    struct Comment {
        address owner;
        string  text;
    }
    struct Hutomomo {
        address owner;
        string title;
        string imageurl;
        bytes  image;
    }

    Hutomomo[] hutomomolist;
    mapping(address => string) username;

    function postHutomomo(string title, string imageurl,bytes image) external returns(bool) {
        if( hutomomolist.length >= 2^8 - 1 ){
            return false;
        }
        Hutomomo memory temp;

        temp.owner = msg.sender;
        temp.title = title;
        temp.imageurl = imageurl;
        temp.image = image;
        
        hutomomolist.push(temp);
        return true;
    }
    function getHutomomoAmount() public constant returns(uint){
        return hutomomolist.length;
    }
    function getHutomomo(uint8 num) public constant returns (address owner, string title, string imageurl, bytes image) {
        owner = hutomomolist[num].owner;
        title = hutomomolist[num].title;
        imageurl = hutomomolist[num].imageurl;
        image = hutomomolist[num].image;
    }
    function setUsername(string name) external {
        username[msg.sender] = name;
    }
    function getUsername(address owner) external constant returns(string) {
        return username[owner];
    }
}
