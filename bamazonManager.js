var mysql = require('mysql');
var inquirer = require("inquirer");
require("console.table");

var bamConn = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "mIamthe076!l",
    database: "bamazon"
});

bamConn.connect(function (err) {
    if (err) throw err;
    loadProducts();
});

function loadProducts() {

    bamConn.query("SELECT * FROM products", function (err, res) {
        if (err) throw err;
        console.table(res);
        promptCustomerForItem(res);
    });
}

function promptCustomerForItem(inventory) {
    inquirer.prompt([
        {
            type: "input",
            name: "choice",
            message: "What is the ID of the item you would you like to purchase? You can quit by pressing Q",
            validate: function (val) {
                return !isNaN(val) || val.toLowerCase() === "q";
            }
        }
    ])
        .then(function (val) {
            checkIfShouldExit(val.choice);
            var choiceId = parseInt(val.choice);
            var product = checkInventory(choiceId, inventory);

            if (product) {
                promptCustomerForQuantity(product);
            }
            else {
                console.log("\nThat item is not in the inventory.");
                loadProducts();
            }
        });
}

function promptCustomerForQuantity(product) {
    inquirer.prompt([
        {
            type: "input",
            name: "quantity",
            message: "How many would you like? [Quit with Q]",
            validate: function (val) {
                return val > 0 || val.toLowerCase() === "q";
            }
        }
    ])
        .then(function (val) {
            checkIfShouldExit(val.quantity);
            var quantity = parseInt(val.quantity);

            if (quantity > product.stock_quantity) {
                console.log("\nInsufficient quantity!");
                loadProducts();
            }
            else {
                makePurchase(product, quantity);
            }
        });
}

function makePurchase(product, quantity) {
    bamConn.query(
        "UPDATE products SET stock_quantity = stock_quantity - ? WHERE item_id = ?",
        [quantity, product.item_id],
        function (err, res) {
            console.log("\nYou have successfully purchased " + quantity + " " + product.product_name + "'s.");
            loadProducts();
        }
    );
}

function checkInventory(choiceId, inventory) {
    for (var i = 0; i < inventory.length; i++) {
        if (inventory[i].item_id === choiceId) {
            return inventory[i];
        }
    }
    return null;
}

function checkIfShouldExit(choice) {
    if (choice.toLowerCase() === "q") {
        // Log a message and exit the current node process
        console.log("Goodbye!");
        process.exit(0);
    }
}