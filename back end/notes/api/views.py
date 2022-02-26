from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import NoteSerializers
from .models import Note


@api_view(['GET', 'POST', 'DELTE'])
def getRoutes(request):
    routes = [
        {
            'Endpoint': '/notes/',
            'method': 'GET',
            'body': None,
            'description': 'Returns an array od notes'
        },
        {
            'Endpoint': '/notes/id',
            'method': 'GET',
            'body': None,
            'description': 'Returns a single note object'
        },
        {
            'Endpoint': '/notes/create/',
            'method': 'POST',
            'body': {'body': ""},
            'description': 'create new notes with data sent in post request'
        },
        {
            'Endpoint': '/notes/id/update/',
            'method': 'PUT',
            'body': {'body': ""},
            'description': 'creates an existing note with data sent in'
        },
        {
            'Endpoint': '/notes/id/delete/',
            'method': 'DELETE',
            'body': None,
            'description': 'Deletes and existing note'
        },
    ]
    return Response(routes)


@api_view(['GET'])
def getNotes(request):
    notes = Note.objects.all()
    serializer = NoteSerializers(notes, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def getNote(request, pk):
    note = Note.objects.get(id=pk)
    serializer = NoteSerializers(note, many=False)
    return Response(serializer.data)


@api_view(['POST'])
def createNote(request):
    data = request.data

    note = Note.objects.create(
        body=data['body']
    )
    serializer = NoteSerializers(note, many=False)
    return Response(serializer.data)


@api_view(['PUT'])
def updateNote(request, pk):
    data = request.data
    note = Note.objects.get(id=pk)

    serializer = NoteSerializers(note, data=request.data)
    if serializer.is_valid():
        serializer.save()

    return Response(serializer.data)


@api_view(['DELETE'])
def deletenote(request, pk):
    note = Note.objects.get(id=pk)
    note.delete()
    return Response("notes was deleted")

