import json
from django.http import JsonResponse
from django.db import connections
from django.db.utils import OperationalError
from django.views.decorators.csrf import csrf_exempt
from .models import User

def healthz(request):
    return JsonResponse({"status": "ok"})

def readyz(request):
    try:
        connections["default"].cursor()
        return JsonResponse({"status": "ready"})
    except OperationalError:
        return JsonResponse({"status": "not ready"}, status=503)

@csrf_exempt
def users(request):
    if request.method == "OPTIONS":
        response = JsonResponse({}, status=200)
        response["Access-Control-Allow-Origin"] = "*"
        response["Access-Control-Allow-Methods"] = "GET, POST, OPTIONS"
        response["Access-Control-Allow-Headers"] = "Content-Type"
        return response

    if request.method == "GET":
        user_list = list(User.objects.values("id", "username", "email"))
        response = JsonResponse(user_list, safe=False, status=200)
        response["Access-Control-Allow-Origin"] = "*"
        return response

    elif request.method == "POST":
        try:
            data = json.loads(request.body)

            username = data.get("username")
            email = data.get("email")

            if not username or not email:
                response = JsonResponse(
                    {"error": "username과 email은 필수입니다."},
                    status=400
                )
                response["Access-Control-Allow-Origin"] = "*"
                return response

            user = User.objects.create(
                username=username,
                email=email
            )

            response = JsonResponse(
                {
                    "id": user.id,
                    "username": user.username,
                    "email": user.email
                },
                status=201
            )
            response["Access-Control-Allow-Origin"] = "*"
            return response

        except Exception as e:
            response = JsonResponse({"error": str(e)}, status=400)
            response["Access-Control-Allow-Origin"] = "*"
            return response

    response = JsonResponse({"error": "Method not allowed"}, status=405)
    response["Access-Control-Allow-Origin"] = "*"
    return response