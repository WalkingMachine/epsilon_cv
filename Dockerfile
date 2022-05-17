FROM osrf/ros:foxy-desktop

# Software Dependencies
#ex : RUN apt-get install festival

RUN mkdir -p ~/dev/src/epsilon_cv

COPY . /root/dev/src

WORKDIR /root/dev

RUN colcon build

RUN sed -i "$d" /ros_entrypoint.sh
RUN echo 'source "/root/dev/install/setup.bash"' >> /ros_entrypoint.sh
RUN echo 'exec "$@"' >> /ros_entrypoint.sh

ENTRYPOINT ["/ros_entrypoint.sh"]
