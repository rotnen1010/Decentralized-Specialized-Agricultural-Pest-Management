# Decentralized Specialized Agricultural Pest Management System

This decentralized application (DApp) provides a blockchain-based solution for coordinated agricultural pest management across farming communities. By leveraging smart contracts, the system enables transparent registration, pest identification, treatment coordination, and effectiveness monitoring to improve regional agricultural outcomes.

## System Overview

The Decentralized Specialized Agricultural Pest Management System consists of four primary smart contracts:

1. **Farm Registration Contract**: Securely stores agricultural operation details and participation status
2. **Pest Identification Contract**: Documents pest threats specific to regional crops
3. **Treatment Coordination Contract**: Facilitates synchronized pest control interventions
4. **Effectiveness Monitoring Contract**: Tracks and analyzes pest management outcomes

## Getting Started

### Prerequisites

- Node.js (v16.0+)
- Truffle Suite or Hardhat
- Web3.js or ethers.js
- MetaMask or similar Web3 wallet

### Installation

1. Clone the repository
   ```
   git clone https://github.com/yourusername/decentralized-pest-management.git
   cd decentralized-pest-management
   ```

2. Install dependencies
   ```
   npm install
   ```

3. Compile smart contracts
   ```
   truffle compile
   ```

4. Deploy to test network
   ```
   truffle migrate --network testnet
   ```

## Smart Contract Architecture

### Farm Registration Contract
Stores essential information about participating farms including location, size, crop types, and contact details. Ensures only authorized entities can register farms.

### Pest Identification Contract
Enables agricultural experts to document pest outbreaks, including species identification, affected crops, severity assessment, and geographic spread.

### Treatment Coordination Contract
Manages the scheduling and implementation of pest control interventions across multiple farms. Includes treatment methods, timing, and responsibilities.

### Effectiveness Monitoring Contract
Tracks the results of pest management efforts through data collection on pest populations, crop damage, and treatment efficacy.

## Usage Examples

### Registering a Farm
```javascript
const farmRegistry = await FarmRegistrationContract.deployed();
await farmRegistry.registerFarm(
  "Green Valley Farms",
  [44.5588, -123.2810],
  150,
  ["wheat", "corn"],
  "contact@greenvalley.com"
);
```

### Reporting a Pest Outbreak
```javascript
const pestIdentifier = await PestIdentificationContract.deployed();
await pestIdentifier.reportPestOutbreak(
  "Aphid infestation",
  ["wheat"],
  3,
  [44.5588, -123.2810],
  "High reproduction rate, concentrated at field edges"
);
```

## Features

- **Decentralized Data Integrity**: All pest management records are immutable and transparent
- **Coordinated Response**: Facilitates synchronized treatment across multiple farms
- **Scientific Analysis**: Provides verifiable data for monitoring treatment effectiveness
- **Regional Optimization**: Enables area-wide strategies rather than isolated interventions

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

For questions or support, please contact: support@decentralizedpestmanagement.org
