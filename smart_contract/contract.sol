// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Rural {
    // Struct para armazenar informações do produtor
    struct Productor {
        uint256 id;
        string name;
        string email;
        string telephone;
        address localization;
    }
    
    // Struct para armazenar informações do animal
    struct Animal {
        address productor;
        uint256 code;
        uint256 weightBirthday;
        uint256 birthday;
        uint256 weaningDate;
        uint256 weaningWeight;
        string category;
        string race;
        string sex;
        string status;
    }

    // Endereço do dono do contrato
    address public owner;
    // Lista de endereços de produtores
    address[] public productorList;
    // Lista de endereços de animais
    address[] public animalList;

    // Mapeamento para armazenar informações dos produtores
    mapping(address => Productor) public productors;
    // Mapeamento para armazenar informações dos animais
    mapping(address => Animal) public animals;

    // Mapeamento para controlar permissões de acesso entre endereços
    mapping(address => mapping(address => bool)) public isApproved;
    // Mapeamento para controlar se um endereço é um produtor
    mapping(address => bool) public isProductor;
    // Mapeamento para controlar se um endereço é um animal
    mapping(address => bool) public isAnimal;

    // Contadores para o número total de produtores, animais e permissões concedidas
    uint256 public productorCount;
    uint256 public animalCount;
    uint256 public permissionGrantedCount;

    // Eventos para notificar alterações no contrato
    event ProductorAdded(address indexed productorAddress);
    event AnimalAdded(address indexed animalAddress, address indexed productorAddress);
    event PermissionGranted(address indexed from, address indexed to);
    event PermissionRevoked(address indexed from, address indexed to);

    // Modificador para verificar se o chamador é o dono do contrato
    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can call this function");
        _;
    }

    // Função construtora que define o dono do contrato
    constructor() {
        owner = msg.sender;
    }

    // Função para registrar detalhes do produtor
    function setDetails(uint256 _id, string memory _name, string memory _email, string memory _telephone, address _localization) public {
        require(!isProductor[msg.sender], "Producer details already set");

        Productor storage p = productors[msg.sender];

        p.id = _id;
        p.name = _name;
        p.email = _email;
        p.telephone = _telephone;
        p.localization = _localization;

        productorList.push(msg.sender);
        isProductor[msg.sender] = true;
        isApproved[msg.sender][msg.sender] = true;
        productorCount++;
        emit ProductorAdded(msg.sender);
    }

    // Função para editar detalhes do produtor
    function editDetails(string memory _email, string memory _telephone, address _localization) public {
        require(isProductor[msg.sender], "Sender is not a producer");

        Productor storage p = productors[msg.sender];
        p.email = _email;
        p.telephone = _telephone;
        p.localization = _localization;
    }
    
    // Função para registrar um novo animal
    function setAnimal(uint256 _code, uint256 _weightBirthday, uint256 _birthday, uint256 _weaningDate, uint256 _weaningWeight, string memory _category,  string memory _race, string memory _sex, string memory _status, address _productor) public {
        require(!isAnimal[msg.sender], "Animal details already set");

        Animal storage a = animals[msg.sender];    
    

        a.code = _code;
        a.weightBirthday = _weightBirthday;
        a.birthday = _birthday;
        a.weaningDate = _weaningDate;
        a.weaningWeight = _weaningWeight;
        a.category = _category;
        a.race = _race;
        a.sex = _sex;
        a.status = _status;
        a.productor = _productor;
    
        animalList.push(msg.sender);
        isAnimal[msg.sender] = true;
        animalCount++;

        emit AnimalAdded(msg.sender, _productor);
    }

    // Função para editar informações de um animal
    function editAnimal(uint256 _weightBirthday, uint256 _birthday, uint256 _weaningDate, uint256 _weaningWeight, string memory _category,  string memory _race, string memory _sex, string memory _status, address _productor) public {
        require(isAnimal[msg.sender], "Sender is not an animal");

        Animal storage a = animals[msg.sender];

        a.weightBirthday = _weightBirthday;
        a.birthday = _birthday;
        a.weaningDate = _weaningDate;
        a.weaningWeight = _weaningWeight;
        a.category = _category;
        a.race = _race;
        a.sex = _sex;
        a.status = _status;
        a.productor = _productor;
    }
    
    // Função para conceder permissão de acesso a outro endereço
    function givePermission(address _localization) public returns(bool) {
        isApproved[msg.sender][_localization] = true;
        permissionGrantedCount++;
        emit PermissionGranted(msg.sender, _localization);
        return true;
    }

    // Função para revogar permissão de acesso de outro endereço
    function revokePermission(address _localization) public returns(bool) {
        isApproved[msg.sender][_localization] = false;
        emit PermissionRevoked(msg.sender, _localization);
        return true;
    }

    // Função para obter a lista de produtores
    function getProductors() public view returns(address[] memory) {
        return productorList;
    }

    // Função para obter a lista de animais
    function getAnimals() public view returns(address[] memory) {
        return animalList;
    }

    // Função para buscar informações de um produtor
    function searchProductorData(address _address) public view returns(uint256, string memory, string memory, string memory, address) {
        require(isApproved[_address][msg.sender], "Not authorized to view producer details");

        Productor storage p = productors[_address];

        return (p.id, p.name, p.email, p.telephone, p.localization);
    }

    // Função para buscar informações de um animal
    function searchAnimalData(address _address) public view returns(address, uint256, uint256, uint256, uint256, uint256, string memory) {
        require(isApproved[_address][msg.sender], "Not authorized to view animal details");

        Animal storage a = animals[_address];

        return (a.productor, a.code, a.weightBirthday, a.birthday, a.weaningDate, a.weaningWeight, a.category);
    }

    // Função para obter o número total de produtores
    function getProductorCount() public view returns(uint256) {
        return productorCount;
    }

    // Função para obter o número total de animais
    function getAnimalCount() public view returns(uint256) {
        return animalCount;
    }
}
