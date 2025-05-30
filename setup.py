from setuptools import setup, find_packages

setup(
    name="git-ai-helper",
    version="1.0.0",
    author="Nikan Eidi",
    author_email="youremail@example.com",  # Replace with your actual email
    description="Interactive Git CLI assistant with AI suggestions and autocomplete",
    long_description=open("README.md").read(),
    long_description_content_type="text/markdown",
    url="https://github.com/NikanEidi/git-ai-helper",
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        "prompt_toolkit>=3.0.0",
        "rich>=12.0.0"
    ],
    entry_points={
        "console_scripts": [
            "git-ai=git_ai_helper.__main__:main",
        ],
    },
    classifiers=[
        "Programming Language :: Python :: 3",
        "Operating System :: OS Independent",
        "License :: OSI Approved :: MIT License",
        "Environment :: Console",
        "Intended Audience :: Developers",
        "Topic :: Software Development :: Version Control :: Git",
    ],
    python_requires=">=3.8",
)