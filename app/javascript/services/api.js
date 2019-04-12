import humps from 'humps';

class ApiService {
  constructor() {
    this.baseUrl = `${window.location.origin}/api/v1`;
    this.headers = new Headers();
    this.headers.append('Content-Type', 'application/json');
    this.options = { headers: this.headers, method: 'GET' };
  }

  getUsers() {
    return fetch(`${this.baseUrl}/users`, this.options)
      .then(response => response.json())
      .then(response => humps.camelizeKeys(response.users));
  }
}

export default ApiService;
