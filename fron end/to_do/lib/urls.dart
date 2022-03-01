var retrieveUrl = Uri.parse('http://10.21.232.116:8000/notes/');

Uri deleteUrl(int id) {
  return Uri.parse('http://10.21.232.116:8000/notes/$id/delete');
}

var createUrl = Uri.parse('http://localhost:8000/notes/create/');
Uri updateUrl(int id) {
  return Uri.parse('http://localhost:8000/notes/$id/update/');
}
