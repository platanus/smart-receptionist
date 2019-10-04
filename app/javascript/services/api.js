import humps from 'humps';

class ApiService {
  constructor() {
    this.baseUrl = `${window.location.origin}/api/v1`;
    this.headers = new Headers();
    this.headers.append('Content-Type', 'application/json');
    this.headers.append('X-CSRF-Token', document.querySelector('meta[name="csrf-token"]').getAttribute('content'));
    this.options = { headers: this.headers, method: 'GET' };
  }

  openFrontDoor(code) {
    return fetch(`${window.location.origin}/api/v1/open_main_door`, {
      ...this.options,
      method: 'POST',
      body: JSON.stringify({code}),
    })
  }

  getUsers() {
    return fetch(`${this.baseUrl}/users`, this.options)
      .then(response => response.json())
      .then(response => humps.camelizeKeys(response.users));
  }

  notifyUser(userId) {
    const body = { isPrivate: true, userId: userId }
    return fetch(`${this.baseUrl}/notifications`, {
      ...this.options,
      method: 'POST',
      body: JSON.stringify(humps.decamelizeKeys(body)),
    });
  }

  notifyChannel(companyName, message) {
    const body = { isPrivate: false, companyName: companyName, message: message }
    return fetch(`${this.baseUrl}/notifications`, {
      ...this.options,
      method: 'POST',
      body: JSON.stringify(humps.decamelizeKeys(body)),
    });
  }
}

export default ApiService;
