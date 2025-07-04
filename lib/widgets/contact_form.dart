import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // In a real app, this is where you'd send the data
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message sent successfully!')),
      );

      // Clear the form
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.mail_outline, color: theme.colorScheme.primary),
                    const SizedBox(width: 8),
                    Text('Contact Me', style: theme.textTheme.titleLarge),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Enter your name' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your email';
                    } else if (!value.contains('@')) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _messageController,
                  decoration: const InputDecoration(labelText: 'Message'),
                  maxLines: 4,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Enter your message' : null,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    onPressed: _submitForm,
                    icon: const Icon(Icons.send),
                    label: const Text('Send'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
