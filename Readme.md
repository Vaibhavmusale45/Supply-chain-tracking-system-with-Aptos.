# Supply Chain Tracking System on Aptos

## Introduction
The Supply Chain Tracking System is a blockchain-based solution built on the Aptos network that enables transparent and immutable tracking of products throughout their supply chain journey. This smart contract provides a decentralized way to monitor product movement, ensuring authenticity and traceability from manufacturer to end delivery.

## Features
- **Product Creation**: Manufacturers can register new products with unique identifiers
- **Status Tracking**: Real-time updates of product location and status
- **Timestamp Recording**: Automatic recording of all status changes
- **Status Verification**: Built-in validation to ensure proper status progression
- **Ownership Tracking**: Clear record of product manufacturer and handlers

## Technical Details

### Contract Address
```
Testnet: 0x[TO BE DEPLOYED]
Mainnet: 0x[TO BE DEPLOYED]
```

### Smart Contract Functions

1. `create_product`
   - Creates a new product entry in the supply chain
   - Parameters:
     - product_id: String
     - description: String
     - location: String

2. `update_product_status`
   - Updates the status and location of an existing product
   - Parameters:
     - product_address: address
     - new_location: String
     - new_status: u8 (1: Created, 2: In Transit, 3: Delivered)

## Project Vision
The Supply Chain Tracking System aims to revolutionize supply chain management by providing:
- Complete transparency in product movement
- Reduction in counterfeit products
- Enhanced trust between stakeholders
- Real-time tracking capabilities
- Immutable record of product journey
- Simplified supply chain auditing

## Future Goals

### Phase 1 (Q3 2024)
- [x] Basic product tracking implementation
- [ ] Integration with QR code scanning
- [ ] Mobile application for status updates
- [ ] Multi-signature validation for status updates

### Phase 2 (Q4 2024)
- [ ] Temperature and condition monitoring
- [ ] Automated alerts system
- [ ] Batch processing capabilities
- [ ] Integration with IoT devices

### Phase 3 (2025)
- [ ] AI-powered predictive analytics
- [ ] Cross-chain interoperability
- [ ] Carbon footprint tracking
- [ ] Supply chain optimization suggestions

## Getting Started

1. Install the Aptos CLI
```bash
curl -fsSL "https://aptos.dev/scripts/install_cli.py" | python3
```

2. Initialize the Project
```bash
aptos init
```

3. Deploy the Contract
```bash
aptos move compile
aptos move publish
```

4. Interact with the Contract
```bash
# Create a new product
aptos move run --function-id "address::Tracking::create_product" \
    --args string:"PROD123" string:"Product Description" string:"Warehouse A"

# Update product status
aptos move run --function-id "address::Tracking::update_product_status" \
    --args address:product_address string:"Distribution Center" u8:2
```

## Security Considerations
- Only authorized addresses can update product status
- Status updates are immutable once recorded
- Built-in validation prevents invalid status transitions

## Contributing
We welcome contributions to the Supply Chain Tracking System. Please feel free to submit issues and pull requests.

## Contact
For any queries regarding the project, please reach out to:
- Project Lead: [vaibhav musale]
- Development Team: [musalevaibhaw@gmail.com]

---
