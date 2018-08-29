FROM alpine:latest AS build
COPY sleep.s .
RUN apk add --no-cache binutils nasm 
RUN nasm -f elf64 sleep.s && ld sleep.o -o sleep

FROM scratch
COPY --from=build sleep .
CMD ["./sleep"]
