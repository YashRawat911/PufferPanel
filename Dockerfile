# Start with the `fredblgr/ubuntu-novnc:20.04` image
FROM fredblgr/ubuntu-novnc:20.04

# Expose the container's port 80 to the host
EXPOSE 8000

# Start the 'tightvncserver' and 'novnc'
CMD tightvncserver :1 -geometry 1024x768 -depth 24 & novnc
