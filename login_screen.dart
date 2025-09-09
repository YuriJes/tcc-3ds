import 'package:flutter/material.dart';
import 'create_password_screen.dart';
import 'register_step1_screen.dart';
import 'home_cuidador_screen.dart'; // Importe a tela HomeCuidadorScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                "Login",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
              const SizedBox(height: 10),
              const Text(
                "Bem-Vindo!\nDigite os seus dados de acesso corretamente.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            const SizedBox(height: 30),
              Image.asset('assets/image-removebg-preview.png', height: 150),
              const SizedBox(height: 20),
              const Text(
                "Bem-Vindo!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.lightBlue),
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email ou Telefone",
                  filled: true,
                  fillColor: Colors.lightBlue.shade100,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  filled: true,
                  fillColor: Colors.lightBlue.shade100,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  suffixIcon: IconButton(
                    icon: Icon(obscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() => obscurePassword = !obscurePassword);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const CreatePasswordScreen()));
                  },
                  child: const Text("Esqueceu sua senha?", style: TextStyle(color: Colors.lightBlue)),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Lógica adicionada para navegar para a tela Home
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeCuidadorScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                ),
                child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => RegisterStep1Screen()),
                      );
                    },
                    child: const Text(
                      "Cadastre-se",
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}