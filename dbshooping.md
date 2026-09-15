```mermaid
erDiagram
    customer {
        string customer_id PK
        string name
        string email
        string phone_number
        string address
        string city
        string province
        string postal_code
    }

    products {
        int product_id PK
        string category_id FK
        string product_name
        string description
        int price
        int stock
    }

    category {
        string category_id PK
        string category_name
        string description
    }

    orders {
        int order_id PK
        string customer_id FK
        int product_id FK
        timestamp order_date
        int qty
    }

    payment {
        int payment_id PK
        int order_id FK
        string customer_id
        timestamp payment_date
        string payment_method
        int amount
        string status
    }

    shipment {
        int shipment_id PK
        int order_id FK
        string address
        string courier
        string tracking_number
    }

    %% Relasi Antar Tabel
    category ||--o{ products : "has"
    customer ||--o{ orders : "places"
    products ||--o{ orders : "included_in"
    orders ||--|| payment : "paid_by"
    orders ||--|| shipment : "shipped_via"
```
