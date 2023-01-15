# GreenGardenMarket API

## Products

### List products

`GET /products`

Retrieves a list of all products available for purchase.

#### Query Parameters

| Name | Type | Description |
|------|------|-------------|
| category_id | integer | Filters products by category |
| farmer_id | integer | Filters products by farmer |
| name | string | Filters products by name |

#### Example

GET /products?category_id=1

200 OK

[
{
"id": 1,
"name": "Apple",
"description": "A juicy and delicious apple",
"price": "1.99",
"image": "https://example.com/apple.jpg",
"farmer_id": 1,
"category_id": 1
},
{
"id": 2,
"name": "Banana",
"description": "A sweet and creamy banana",
"price": "0.99",
"image": "https://example.com/banana.jpg",
"farmer_id": 2,
"category_id": 1
}
]

### Create product

`POST /products`

Creates a new product.

#### Request Body

| Name | Type | Description |
|------|------|-------------|
| name | string | The name of the product |
| description | string | A description of the product |
| price | decimal | The price of the product |
| image | string | The URL of the product image |
