// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrgRegistry {
    struct Organization {
        string name;
        address tokenContract;
        mapping(address => uint256) vestingPeriods;
        mapping(address => bool) whitelisted;
    }

    mapping(address => Organization) public organizations;

    event OrganizationRegistered(address indexed orgAddress, string name, address tokenContract);
    event StakeholderAdded(address indexed orgAddress, address stakeholder, uint256 vestingPeriod);
    event WhitelistUpdated(address indexed orgAddress, address stakeholder, bool whitelisted);

    function registerOrganization(string memory _name, address _tokenContract) external {
        Organization storage org = organizations[msg.sender];
        org.name = _name;
        org.tokenContract = _tokenContract;
        emit OrganizationRegistered(msg.sender, _name, _tokenContract);
    }

    function addStakeholder(address _stakeholder, uint256 _vestingPeriod) external {
        Organization storage org = organizations[msg.sender];
        org.vestingPeriods[_stakeholder] = _vestingPeriod;
        emit StakeholderAdded(msg.sender, _stakeholder, _vestingPeriod);
    }

    function updateWhitelist(address _stakeholder, bool _whitelisted) external {
        Organization storage org = organizations[msg.sender];
        org.whitelisted[_stakeholder] = _whitelisted;
        emit WhitelistUpdated(msg.sender, _stakeholder, _whitelisted);
    }
}
