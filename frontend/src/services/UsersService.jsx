// import { checkTokenAndRedirect } from './AuthService';

import apiClient from "../utils/apiClient.js";

export async function fetchUsers() {
  const response = await apiClient.get('/api/users');
  if (!response.ok) {
    console.error(response.error);
  }

  return await response.json();
}

export async function addUser(user) {
  const token = localStorage.getItem('jwtToken');
  if (!token) {
    throw new Error('No token found');
  }

  const userData = {
    id: 0,
    title: user.title || 'Untitled',
    author: user.author || 'Unknown',
    genre: user.genre || 'Undefined',
    description: user.description || 'No description',
    status: user.status || 'В наявності',
    borrowerId: user.borrowerId || null,
    createdAt: user.createdAt || new Date().toISOString(),
    updatedAt: new Date().toISOString(),
  };

  const config = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`,
    },
    body: JSON.stringify(userData),
  };

  const response = await fetch(API_URL_BOOKS, config);
  await checkTokenAndRedirect(response);

  if (!response.ok) {
    throw new Error('Failed to add user');
  }

  return await response.json();
}

export async function updateUser(user) {
  const token = localStorage.getItem('jwtToken');
  if (!token) {
    throw new Error('No token found');
  }

  const userData = {
    id: user.id,
    title: user.title || 'Untitled',
    author: user.author || 'Unknown',
    genre: user.genre || 'Undefined',
    description: user.description || 'No description',
    status: user.status || 'В наявності',
    borrowerId: user.borrowerId || null,
    createdAt: user.createdAt,
    updatedAt: new Date().toISOString(),
  };

  const config = {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`,
    },
    body: JSON.stringify(userData),
  };

  const response = await fetch(`${API_URL_BOOKS}/${user.id}`, config);
  await checkTokenAndRedirect(response);

  if (!response.ok) {
    throw new Error('Failed to update user');
  }

  return await response.json();
}

export async function deleteUser(userId) {
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

  const response = await fetch(`${API_URL_BOOKS}/${userId}`, config);
  await checkTokenAndRedirect(response);

  if (!response.ok) {
    throw new Error('Failed to delete user');
  }

  return await response.json();
}
