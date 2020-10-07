import { PrismaClient } from "@prisma/client";

async function main() {
  const prisma = new PrismaClient();

  const data = await prisma.member.findMany({
    select: {
      id: true,
      account: {
        select: {
          accountAddresses: {
            select: {
              address: {
                select: {
                  id: true,
                },
              },
            },
          },
        },
      },
    },
  });
  console.log(data);
  prisma.$disconnect();
}

main();
