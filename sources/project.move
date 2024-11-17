module SupplyChainTrackingsysTemwithAptos::Tracking {
    use std::string::String;
    use aptos_framework::timestamp;
    use aptos_framework::signer;
    
    /// Error codes
    const ENO_PRODUCT_FOUND: u64 = 1;
    const EINVALID_STATUS: u64 = 2;

    /// Represents the current status of a product in supply chain
    struct ProductStatus has copy, drop {
        location: String,
        timestamp: u64,
        status: u8,  // 1: Created, 2: In Transit, 3: Delivered
    }

    /// Main product structure to track in supply chain
    struct Product has key, store {
        id: String,
        manufacturer: address,
        current_status: ProductStatus,
        description: String,
    }

    /// Creates a new product entry in the supply chain
    public entry fun create_product(
        account: &signer,
        product_id: String,
        description: String,
        location: String,
    ) {
        let product = Product {
            id: product_id,
            manufacturer: signer::address_of(account),
            current_status: ProductStatus {
                location,
                timestamp: timestamp::now_seconds(),
                status: 1, // Created
            },
            description,
        };
        move_to(account, product);
    }

    /// Updates the status of an existing product
    public entry fun update_product_status(
        account: &signer,
        product_address: address,
        new_location: String,
        new_status: u8,
    ) acquires Product {
        assert!(exists<Product>(product_address), ENO_PRODUCT_FOUND);
        assert!(new_status <= 3, EINVALID_STATUS);

        let product = borrow_global_mut<Product>(product_address);
        product.current_status = ProductStatus {
            location: new_location,
            timestamp: timestamp::now_seconds(),
            status: new_status,
        };
    }
}