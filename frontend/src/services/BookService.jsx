import { checkTokenAndRedirect } from './AuthService';

const API_URL_BOOKS = `http://206.189.52.50:5001/api/books`;
const API_URL_VISITORS = `http://206.189.52.50:5001/api/visitors`;

export async function fetchBooks() {
  const token = localStorage.getItem('jwtToken');
  if (!token) {
    throw new Error('No token found');
  }

  const config = {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`,
    },
  };

  const response = await fetch(API_URL_BOOKS, config);
  await checkTokenAndRedirect(response);
  if (!response.ok) {
    throw new Error('Failed to fetch books');
  }

  return await response.json();
}

export async function fetchVisitors() {
  try {
    const token = localStorage.getItem('jwtToken');
    const config = {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`,
      },
    };
    const response = await fetch(API_URL_VISITORS, config);
    await checkTokenAndRedirect(response);
    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Error fetching visitors:', error);
  }
}

export async function addBook(book) {
  const token = localStorage.getItem('jwtToken');
  if (!token) {
    throw new Error('No token found');
  }

  const bookData = {
    id: 0,
    title: book.title || 'Untitled',
    author: book.author || 'Unknown',
    genre: book.genre || 'Undefined',
    description: book.description || 'No description',
    status: book.status || 'В наявності',
    borrowerId: book.borrowerId || null,
    createdAt: book.createdAt || new Date().toISOString(),
    updatedAt: new Date().toISOString(),
  };

  const config = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`,
    },
    body: JSON.stringify(bookData),
  };

  const response = await fetch(API_URL_BOOKS, config);
  await checkTokenAndRedirect(response);

  if (!response.ok) {
    throw new Error('Failed to add book');
  }

  return await response.json();
}

export async function updateBook(book) {
  const token = localStorage.getItem('jwtToken');
  if (!token) {
    throw new Error('No token found');
  }

  const bookData = {
    id: book.id,
    title: book.title || 'Untitled',
    author: book.author || 'Unknown',
    genre: book.genre || 'Undefined',
    description: book.description || 'No description',
    status: book.status || 'В наявності',
    borrowerId: book.borrowerId || null,
    createdAt: book.createdAt,
    updatedAt: new Date().toISOString(),
  };

  const config = {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`,
    },
    body: JSON.stringify(bookData),
  };

  const response = await fetch(`${API_URL_BOOKS}/${book.id}`, config);
  await checkTokenAndRedirect(response);

  if (!response.ok) {
    throw new Error('Failed to update book');
  }

  return await response.json();
}

export async function deleteBook(bookId) {
  const token = localStorage.getItem('jwtToken');
  if (!token) {
    throw new Error('No token found');
  }

  const config = {
    method: 'DELETE',
    headers: {
      'Authorization': `Bearer ${token}`,
    },
  };

  const response = await fetch(`${API_URL_BOOKS}/${bookId}`, config);
  await checkTokenAndRedirect(response);

  if (!response.ok) {
    throw new Error('Failed to delete book');
  }

  return await response.json();
}
