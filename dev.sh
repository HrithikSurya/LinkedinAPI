# Open a new terminal and execute each command
gnome-terminal -- bash -c "echo 'redis server running here'; redis-server; exec bash"
gnome-terminal -- bash -c "echo 'sidekiq running here'; bundle exec sidekiq; exec bash"
gnome-terminal -- bash -c "echo 'rails server running here'; rails server; exec bash"
