const cds = require('@sap/cds');

// Define your function to get books by author name
async function getBooksByAuthor(authorName) {
    // Get the database connection
    const db = await cds.connect.to('db');
    
    // Define the query
    const { Books, Authors } = db.entities;

    // Perform the query to find the books by the given author
    const books = await db
        .read(Books)
        .where({ 'author_name.name': authorName })
        .columns('title');

    return books.map(book => book.title);
}

// Export the function to use it in other parts of your application
// module.exports = { getBooksByAuthor };

module.exports = cds.service.impl(async function() {
    this.on('getBooksByAuthor', async (req) => {
        const authorName = req.data.authorName;
        const books = await getBooksByAuthor(authorName);
        return books;
    });
});
