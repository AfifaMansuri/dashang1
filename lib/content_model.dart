class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingContent> contents = [
  OnboardingContent(
    title: 'Welcome...',
    image: 'assets/welcome.jpeg',
    description: 'A travel platform which offers a unique way of exploring the world by breaking away from the usual tourist path',
  ),
  OnboardingContent(
    title: 'How it works..',
    image: 'assets/works.png',
    description: '1. Sign in at swap it! for free\n'
        '2. Find a Home for swapping or renting',
  ),
  OnboardingContent(
    title: 'How it works..',
    image: 'assets/works2.png',
    description: '3. Make a deal with a potential home of your needs\n'
        '4. Get to call a unique place  home during your adventures',
  ),
];
